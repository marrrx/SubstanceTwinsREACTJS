import "bootstrap/dist/css/bootstrap.min.css"
import "bootstrap/dist/js/bootstrap.min.js"
import React, { useEffect, useState } from 'react'
import Navbar from '../components/Navbar/Navbar'
import useProduct from '../contexts/Products&Categories/context/useProduct';
import useSWR from 'swr';
import Card from '../components/ProductCard/Card';
import clientAxios from '../config/axios/ClientAxios';
import Modal from "react-modal";
import ProductModal from "../components/ProductCardModal/ProductModal";
import useAuth from "../contexts/Auth/context/useAuth";

Modal.setAppElement('#root');


function Index() {
    const { user, isAuthenticated } = useAuth();
    const { categories, actualCategory, clearCategory, modal, searchTerm, setSearchTerm, filteredProducts,
        setFilteredProducts } = useProduct();
        const [products, setProducts] = useState([]);


    const fetcher = () => clientAxios('/api/products').then(datos => datos.data);
    const { data, isLoading } = useSWR('/api/products', fetcher, { refreshInterval: 10000 });

    useEffect(() => {
        if (data) {
            setProducts(data.data);
        }
    }, [data]);

    useEffect(() => {
        if (actualCategory && products.length > 0) {
            const filteredByCategory = products.filter(
                (product) => product.categories_id === actualCategory.id
            );
            setFilteredProducts(filteredByCategory);
        } else {
            // If no category selected, reset to all products
            setFilteredProducts(products);
        }
    }, [actualCategory, products]);

    useEffect(() => {
        if (searchTerm && products.length > 0) {
            const filtered = products.filter((product) =>
                product.name.toLowerCase().includes(searchTerm.toLowerCase())
            );
            setFilteredProducts(filtered);
        } else {
            if (actualCategory) {
                const filteredByCategory = products.filter(
                    (product) => product.categories_id === actualCategory.id
                );
                setFilteredProducts(filteredByCategory);
            } else {
                setFilteredProducts(products);
            }
        }
    }, [searchTerm, products, actualCategory]);

console.log(filteredProducts)
    return (
        <>
            <Navbar user={user} isAuthenticated={isAuthenticated} categories={categories} clearCategory={clearCategory} />



            <br />
            <div className="mt-5 p-5">
                {actualCategory === null ? (
                    <h1>
                        All products
                    </h1>

                ) : (
                    <h1>
                        {actualCategory.name}
                    </h1>
                )}
                <h4 >Choose the products you want add to the cart.</h4>

                <div className="row row-cols-4 mt-4">
                    {filteredProducts.map((product) => (
                        <Card key={product.id} product={product} />
                    ))}
                </div>
            </div>

            {modal && (
                <Modal isOpen={modal} style={customStyles}>
                    <ProductModal user={user} isAuthenticated={isAuthenticated} />
                </Modal>
            )}



        </>
    )
}
const customStyles = {
    content: {
        top: "50%",
        left: "50%",
        right: "auto",
        bottom: "auto",
        marginRight: "-50%",
        transform: "translate(-50%, -50%)",
    },
};

export default Index
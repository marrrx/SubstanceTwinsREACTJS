import React, { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import useSWR from 'swr';
import useProduct from '../contexts/Products&Categories/context/useProduct';
import CategoryStatesMenu from '../components/AuthComponents/Products/CategoryStatesMenu';
import ProductsTable from '../components/AuthComponents/Products/ProductsTable';
import useAuth from '../contexts/Auth/context/useAuth';
import clientAxios from '../config/axios/ClientAxios';
import Modal from "react-modal";
import ProductModal from '../components/ProductCardModal/ProductModal';

Modal.setAppElement('#root');


export default function Products({ user, isAuthenticated }) {

  const navigate = useNavigate();

  const { categories, handleClickCategory, clearCategory, actualCategory, modal, handleClickModal, handleSetProduct, getProduct, deleteProduct, setProduct} = useProduct();
  const { accessToken } = useAuth();


  const fetcher = () => clientAxios('/api/products').then(datos => datos.data);
  const { data, isLoading } = useSWR('/api/products', fetcher, { refreshInterval: 1000 });

  const products = isLoading ? [] :
    actualCategory ? data.data.filter(product => product.categories_id === actualCategory.id) : data.data;




  return (
    <>
      <div className='container justify-content-center p-xxl-5 '>
        <div className='row'>
          <div className='col-10'>
            {actualCategory === null ? (
              <h1>
                All products
              </h1>

            ) : (
              <h1>
                {actualCategory.name}
              </h1>
            )}
          </div>
          <div className='col'>
            <button onClick={() => navigate('/dashboard')}>
              Go Back
            </button>
          </div>
        </div>
        <hr />

        <div className='row'>
          <div className='col mt-xxl-5 '>
            <CategoryStatesMenu categories={categories} handleClickCategory={handleClickCategory} clearCategory={clearCategory} />
          </div>
          <div className='col-2 mt-3'>
          <button onClick={() => { handleClickModal() }} className='btn btn-success'>
              ➕
            </button>
          </div>
        </div>


        <ProductsTable products={products} handleClickModal={handleClickModal} handleSetProduct={handleSetProduct} getProduct={getProduct} deleteProduct={deleteProduct} />

      </div>
      {modal && (
        <Modal isOpen={modal} style={customStyles}>
          <ProductModal user={user} />
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


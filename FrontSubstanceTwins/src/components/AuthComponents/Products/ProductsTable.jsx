import React from 'react'
import swal from 'sweetalert';


export default function ProductsTable({ products, handleClickModal, handleSetProduct, getProduct, deleteProduct }) {


    const showAlert = ({ product }) => {
        const { id } = product;
        swal({
            title: "Are you sure?",
            text: "Once deleted, you will not be able to recover this product!",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
        .then((willDelete) => {
            if (willDelete) {
                deleteProduct(id)
                    .then(() => {
                        swal("Poof! Your product has been deleted!", {
                            icon: "success",
                        });
                    })
                    .catch(error => {
                        swal("Error!", "An error occurred while deleting the product.", "error");
                        console.error("Error deleting product:", error);
                    });
            } 
        });
    }
    


return (
    <>
        <table className='table table-light'>
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Description</th>
                    <th scope="col">Category</th>
                    <th scope="col">Price</th>
                    <th scope="col">Images</th>
                    <th scope="col">Actions</th>

                </tr>
            </thead>
            <tbody>
                {products.map((product, index) => (
                    <tr key={product.id} className='align-middle'>
                        <td>{product.id}</td>
                        <td>{product.name}</td>
                        <td style={{ width: 300 }}>{product.description}</td>
                        <td>
                            {product.categories_id === 1 ? 'Protein' :
                                product.categories_id === 2 ? 'Creatine' :
                                    product.categories_id === 3 ? 'Pre-Workout' :
                                        'Unknown'}
                        </td>
                        <td>${product.price}</td>
                        <td>
                            <div className='row'>
                                {product.images.map(image => (

                                    <div className='col-5 m-1 ' key={image.id}>
                                        <img style={{ width: 180, height: 220 }} src={image.image_path} />
                                    </div>
                                ))}
                            </div>

                        </td>
                        <td className='align-middle'>
                            <button onClick={() => { handleClickModal(); handleSetProduct(product); getProduct(product.id) }} className='btn btn-warning m-1' >
                                Edit
                            </button>
                            <button className='btn btn-danger' onClick={() => showAlert({ product })}>
                                Delete
                            </button>
                        </td>
                    </tr>
                ))}
            </tbody>
        </table>
    </>
)
}

import "bootstrap/dist/css/bootstrap.min.css"
import "bootstrap/dist/js/bootstrap.min.js"
import React from 'react'
import useProduct from "../../contexts/Products&Categories/context/useProduct";


function Card({ product }) {

    const { id, name, description, price } = product;
    const { handleSetProduct, handleClickModal, getProduct } = useProduct();

    return (
        <>
            <div className="col mb-5">

                <div
                    className="card"
                    style={{
                        boxShadow: "rgba(0, 0, 0, 0.3) 0px 5px 10px, rgba(0, 0, 0, 0.22) 0px 15px 12px",
                    }}
                >

                    <img
                        src={product.images[0].image_path}
                        className="card-img-top"
                        alt={`imagen ${name}`}
                        height={'400px'}
                        style={{
                            borderRadius: '5px',
                        }}
                        loading="lazy"
                    />

                    <div className="card-body">
                        <h5 className="card-title">{name}</h5>
                       
                    
                        <h6 className="card-title">${price}</h6>

                        <a
                            type="button"
                            className="btn btn-warning"
                            onClick={() => {
                                handleClickModal();
                                handleSetProduct(product);
                                getProduct(id)
                            }}

                        >
                            Add
                        </a>
                    </div>
                </div>

            </div>
        </>
    )
}

export default Card
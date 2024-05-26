import React, { useState, useEffect } from 'react'
import useProduct from '../../contexts/Products&Categories/context/useProduct';
import ImageSlider from './ImageSlider';
import swal from 'sweetalert';


export default function ProductModal({ user, isAuthenticated }) {


    const { handleClickModal,
        product,
        handleAddOrder,
        order,
        images,
        setImages,
        updateProduct,
        nameEdit,
        descriptionEdit,
        priceEdit,
        setPriceEdit,
        setNameEdit,
        setDescriptionEdit,
        categoryEdit,
        setCategoryEdit,
        insertProduct,
    } = useProduct();

    const [quantity, setQuantity] = useState(1);
    const [edit, setEdit] = useState(false);



    useEffect(() => {
        if (order.some((orderState) => orderState.id === product.id)) {
            const productEdit = order.filter((orderState) => orderState.id === product.id)[0]

            setQuantity(productEdit.quantity)
            setEdit(true)
        }
    }, [order])


    const handleImagePickerPress = async (event) => {
        try {
            const files = event.target.files;

            if (!files) {
                return; // Evitar errores si no hay archivos seleccionados
            }

            const selectedImages = [];

            for (let i = 0; i < files.length; i++) {
                const file = files[i];

                // Utilizamos FileReader para leer el archivo como base64
                const reader = new FileReader();

                reader.onload = () => {
                    const base64Data = reader.result;
                    const imageData = {
                        uri: base64Data,
                        type: file.type || 'image/jpeg',
                        name: file.name || `temp_image_${i}.jpg`
                    };
                    selectedImages.push(imageData);

                    // Si todas las imágenes se han procesado, actualizamos el estado
                    if (selectedImages.length === files.length) {
                        setImages(selectedImages);
                    }
                };

                // Leemos el archivo como base64
                reader.readAsDataURL(file);
            }
        } catch (error) {
            alert(error);
        }
    };
console.log(images)

    const showInsertAlert = () => {
        swal({
            title: "Are you sure?",
            text: "Check the information before insert the new product!",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
            .then((willInsert) => {
                if (willInsert) {
                    insertProduct()
                    .then(() => {
                        swal("Poof! Your product has been added!", {
                            icon: "success",
                        });
                    })
                       
                        .catch(error => {
                            swal("Error!", "An error occurred while inserting the product.", "error");
                            console.error("Error deleting product:", error);
                        });
                }
            });
    }

    const showUpdateAlert = () => {
        swal({
            title: "Are you sure?",
            text: "Check the information before update the product!",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
            .then((willUpdate) => {
                if (willUpdate) {
                    handleClickModal()
                    updateProduct()
                        .then(() => {
                            swal("Poof! Your product has been updated!", {
                                icon: "success",
                            });
                        })
                        .catch(error => {
                            swal("Error!", "An error occurred while inserting the product.", "error");
                            console.error("Error deleting product:", error);
                        });
                }
            });
    }

    return (
        <>

            {user && user.admin === 0 ? (
                <>
                    <div className="row g-2 mb-3">
                        <div className="col-md-3" style={{ width: 300 }}>
                            <ImageSlider product={product} />
                        </div>
                        <div className="col" style={{ width: 400 }}>
                            <h5 className="fs-2">{product.name}</h5>

                            <p className="mt-4 fs-3">
                                ${product.price}
                            </p>
                            <p className="fs-5 fw-light">
                                {product.description}
                            </p>
                            {user ? (
                                <div className="row row-cols-auto">
                                    <div className="col">
                                        <button
                                            className="btn"
                                            type="button"
                                            onClick={() => {
                                                if (quantity <= 1) return
                                                setQuantity(quantity - 1);
                                            }}
                                        >
                                            <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                width={16}
                                                height={16}
                                                fill="currentColor"
                                                className="bi bi-dash-circle"
                                                viewBox="0 0 16 16"
                                            >
                                                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16" />
                                                <path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8" />
                                            </svg>
                                        </button>
                                    </div>
                                    <div className="col">

                                        <p className="card-text mt-2 ">
                                            <small className="text-body-secondary">{quantity}</small>
                                        </p>
                                    </div>
                                    <div className="col">
                                        <button
                                            className="btn"
                                            type="button"
                                            onClick={() => {
                                                if (quantity >= 5) return
                                                setQuantity(quantity + 1);
                                            }}
                                        >
                                            <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                width={16}
                                                height={16}
                                                fill="currentColor"
                                                className="bi bi-plus-circle"
                                                viewBox="0 0 16 16"
                                            >
                                                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16" />
                                                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4" />
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            ) : (
                                <>
                                </>
                            )}

                        </div>
                    </div>


                    <div>
                        <button
                            type="button"
                            className="btn btn-secondary"
                            onClick={() => {
                                handleClickModal();
                            }}
                        >
                            Close
                        </button>
                        {user ? (
                            <button
                                type="button"
                                className="btn btn-success ms-5"
                                onClick={() => {
                                    handleAddOrder({ ...product, quantity });
                                    setQuantity(1);
                                    handleClickModal();

                                }}
                            >
                                {edit ? "Save changes" : "Add to cart"}
                            </button>
                        ) : (
                            <>
                            </>
                        )}

                    </div>
                </>
            ) : user && user?.admin === 1 ? (
                
                <>
                    <div className="row g-2 mb-3">
                        <div className="col-md-3" style={{ width: 300 }}>
                            <label htmlFor="images">Choose the new product images:</label>
                            <input type="file" id="images" name="images" accept="image/png, image/jpeg" onChange={handleImagePickerPress} multiple />

                            <label className='mt-3'>New selected images:</label>
                            <div style={{ overflowX: 'auto', whiteSpace: 'nowrap' }}>
                                {images.map((image, index) => (
                                    <div key={index} style={{ display: 'inline-block', margin: '0 10px' }}>
                                        <img src={image.uri} alt={image.name} style={{ width: '200px', height: '200px', objectFit: 'cover' }} />
                                    </div>
                                ))}
                            </div>
                        </div>





                        <div className="col" style={{ width: 400 }}>
                            <div className="mb-3">
                                <label htmlFor="name" className="form-label">Name:</label>
                                <input className="form-control" type="text" id="name" value={nameEdit} onChange={(event) => setNameEdit(event.target.value)} required={true} />
                            </div>

                            <div className="mb-3" >
                                <label htmlFor="description" className="form-label">Description:</label>
                                <textarea className="form-control" type="text" id="description" value={descriptionEdit} onChange={(event) => setDescriptionEdit(event.target.value)} required={true} />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="category" className="form-label">Category:</label> <small>Protein=1  Creatine=2  PreWorkout=3</small>
                                <input className="form-control" type="number" id="category" value={categoryEdit} onChange={(event) => setCategoryEdit(event.target.value)} min="1" max="3" required={true} />
                            </div>

                            <div className="mb-3" >
                                <label htmlFor="price" className="form-label">Price:</label>
                                <input className="form-control" type="number" id="price" value={priceEdit} onChange={(event) => setPriceEdit(event.target.value)} required={true} />
                            </div>
                        </div>








                    </div>


                    <div>
                        <button
                            type="button"
                            className="btn btn-danger"
                            onClick={() => {
                                handleClickModal();
                            }}
                        >
                            Cancel
                        </button>

                        {Object.keys(product).length === 0 ? (
                            <>
                                {/* Botón "Insert product" si el objeto product está vacío */}
                                <button
                                    type="button"
                                    className="btn btn-success mx-4"
                                    onClick={showInsertAlert}
                                >
                                    Insert product
                                </button>
                            </>
                        ) : (
                            <>
                                {/* Botón "Save changes" si el objeto product no está vacío */}
                                <button
                                    type="button"
                                    className="btn btn-success mx-4"
                                    onClick={showUpdateAlert}
                                >
                                    Save changes
                                </button>
                            </>
                        )}



                    </div>
                </>
            ) : (
                <>
                    <div className="row g-2 mb-3">
                        <div className="col-md-3" style={{ width: 300 }}>
                            <ImageSlider product={product} />
                        </div>
                        <div className="col" style={{ width: 400 }}>
                            <h5 className="fs-2">{product.name}</h5>

                            <p className="mt-4 fs-3">
                                ${product.price}
                            </p>
                            <p className="fs-5 fw-light">
                                {product.description}
                            </p>
                            {user ? (
                                <div className="row row-cols-auto">
                                    <div className="col">
                                        <button
                                            className="btn"
                                            type="button"
                                            onClick={() => {
                                                if (quantity <= 1) return
                                                setQuantity(quantity - 1);
                                            }}
                                        >
                                            <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                width={16}
                                                height={16}
                                                fill="currentColor"
                                                className="bi bi-dash-circle"
                                                viewBox="0 0 16 16"
                                            >
                                                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16" />
                                                <path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8" />
                                            </svg>
                                        </button>
                                    </div>
                                    <div className="col">

                                        <p className="card-text mt-2 ">
                                            <small className="text-body-secondary">{quantity}</small>
                                        </p>
                                    </div>
                                    <div className="col">
                                        <button
                                            className="btn"
                                            type="button"
                                            onClick={() => {
                                                if (quantity >= 5) return
                                                setQuantity(quantity + 1);
                                            }}
                                        >
                                            <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                width={16}
                                                height={16}
                                                fill="currentColor"
                                                className="bi bi-plus-circle"
                                                viewBox="0 0 16 16"
                                            >
                                                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16" />
                                                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4" />
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            ) : (
                                <>
                                </>
                            )}

                        </div>
                    </div>


                    <div>
                        <button
                            type="button"
                            className="btn btn-secondary"
                            onClick={() => {
                                handleClickModal();
                            }}
                        >
                            Close
                        </button>
                        {user ? (
                            <button
                                type="button"
                                className="btn btn-success ms-5"
                                onClick={() => {
                                    handleAddOrder({ ...product, quantity });
                                    setQuantity(1);
                                    handleClickModal();

                                }}
                            >
                                {edit ? "Save changes" : "Add to cart"}
                            </button>
                        ) : (
                            <>
                            </>
                        )}

                    </div>
                </>
            )}

        </>
    )
}

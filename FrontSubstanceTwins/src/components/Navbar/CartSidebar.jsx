import React from 'react'
import useProduct from '../../contexts/Products&Categories/context/useProduct';
import OrderReviewInCart from './OrderReviewInCart'
import swal from 'sweetalert';

function CartSidebar() {


    const { order, total, SubmitNewOrder } = useProduct();
    const testOrder = () => order.length === 0;

    const SubmmitOrderAlert = () => {
        swal({
            title: "Are you sure?",
            text: "Check your cart before confirm the order!",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
            .then((willSubmit) => {
                if (willSubmit) {
                    SubmitNewOrder()
                        .then(() => {
                            swal("Poof! Your order has been confirmed!", {
                                icon: "success",
                            });
                        })
                        .catch(error => {
                            swal("Error!", "An error occurred while confirmed the order.", "error");
                            console.error("Error confirm order:", error);
                        });
                }
            });
    }

    return (
        <>
            <div
                className="offcanvas offcanvas-end "
                tabIndex={-1}
                id="offcanvasCart"
                aria-labelledby="offcanvasRightLabel"
            >
                <div className="offcanvas-header">
                    <h3 className="offcanvas-title ms-3 " id="offcanvasRightLabel">
                        Cart
                    </h3>

                    <button
                        type="button"
                        className="btn-close"
                        data-bs-dismiss="offcanvaCart"
                        aria-label="Close"
                    />

                </div>
                <hr />
                <div className="offcanvas-body">
                    <div className="container">
                        <h5>Here you can see all the products added to your cart.</h5>
                        <hr></hr>

                        <div className="mt-4 mb-4 " style={{ overflowY: "scroll", height: 400 }}>
                            {order.length === 0 ? (
                                <h2 className="mt-5 text-center">Are not products on your cart yet</h2>
                            ) : (
                                order.map(product => (
                                    <OrderReviewInCart
                                        key={product.id}
                                        product={product}
                                    />
                                ))
                            )}


                        </div>

                        <h6 className="">Total: {''}
                            ${total}
                        </h6>
                    </div>

                    <form>
                        <div className="mx-auto p-2" >
                            <input
                                type="button"
                                className={`${testOrder() ? " btn btn-disabled" : "btn btn-warning"} mb-3`}
                                aria-label="Close"
                                disabled={testOrder()}
                                value="Checkout"
                                data-bs-dismiss="offcanvas"
                                onClick={SubmmitOrderAlert}
                            />
                        </div>

                    </form>
                </div>

            </div>
        </>
    )
}

export default CartSidebar
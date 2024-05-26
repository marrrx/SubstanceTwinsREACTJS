import "bootstrap/dist/css/bootstrap.min.css"
import "bootstrap/dist/js/bootstrap.min.js"
import React from 'react'
import UserSidebar from "./UserSidebar"
import CategoriesButton from "./CategoriesButton"
import CartSidebar from "./CartSidebar"
import { useNavigate } from "react-router-dom"
import useProduct from "../../contexts/Products&Categories/context/useProduct"

function Navbar({ user, isAuthenticated, categories, clearCategory }) {
    const navigate = useNavigate();

    const {setSearchTerm, searchTerm} = useProduct();

    const handleSearchChange = (event) => {
        setSearchTerm(event.target.value);
    };
    return (
        <>
            {isAuthenticated && user?.admin == 1 ? (
                <>
                    <nav className="navbar fixed-top  bg-body-tertiary" data-bs-theme="dark">
                        <div className="container-fluid">
                            <div>
                                <button
                                    className="navbar-toggler"
                                    type="button"
                                    data-bs-toggle="offcanvas"
                                    data-bs-target="#offcanvas"
                                    aria-controls="offcanvasNavbar"
                                    aria-label="Toggle navigation"
                                >
                                    <span className="navbar-toggler-icon" />
                                </button>
                                <div
                                    className="offcanvas offcanvas-start "
                                    tabIndex={-1}
                                    id="offcanvas"
                                    aria-labelledby="offcanvasLabel"
                                >
                                    <div className="offcanvas-header">
                                        <h3 className="offcanvas-title" id="offcanvasLabel">
                                            Menu
                                        </h3>
                                        <button
                                            type="button"
                                            className="btn-close me-3 "
                                            data-bs-dismiss="offcanvas"
                                            aria-label="Close"
                                        />
                                    </div>
                                    <hr />
                                    <div className="offcanvas-body">
                                        <ul className="navbar-nav justify-content-end flex-grow-1 pe-3">
                                            <li className="nav-item">
                                                <button
                                                    className="nav-link"
                                                    type="button"
                                                    data-bs-dismiss="offcanvas"
                                                    onClick={() => navigate('/products')}
                                                >
                                                    Products
                                                </button>
                                            </li>
                                            <li className="nav-item">
                                                <button
                                                    className="nav-link"
                                                    type="button"
                                                    data-bs-dismiss="offcanvas"
                                                    onClick={() => navigate('/orders')}
                                                >
                                                    Orders
                                                </button>
                                            </li>
                                            <li className="nav-item">
                                                <button
                                                    className="nav-link"
                                                    type="button"
                                                    data-bs-dismiss="offcanvas"
                                                    onClick={() => navigate('/users')}
                                                >
                                                    Users
                                                </button>
                                            </li>


                                        </ul>
                                    </div>
                                </div>
                            </div>


                            <div className="mx-1 ">

                                <button
                                    className="btn"
                                    type="button"
                                    data-bs-toggle="offcanvas"
                                    data-bs-target="#offcanvasUser"
                                    aria-controls="offcanvasRight"
                                    aria-label="Toggle User"

                                >
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width={40}
                                        height={40}
                                        fill="currentColor"
                                        className="bi bi-person-circle"
                                        viewBox="0 0 16 16"
                                    >
                                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                                        <path
                                            fillRule="evenodd"
                                            d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"
                                        />
                                    </svg>
                                </button>
                                <UserSidebar user={user} isAuthenticated={isAuthenticated} />
                            </div>
                        </div>




                    </nav>
                </>
            ) : isAuthenticated ? (
                <>
                    <nav className="navbar fixed-top  bg-body-tertiary" data-bs-theme="dark">
                        <div className="container-fluid">
                            <div>
                                <button
                                    className="navbar-toggler"
                                    type="button"
                                    data-bs-toggle="offcanvas"
                                    data-bs-target="#offcanvas"
                                    aria-controls="offcanvasNavbar"
                                    aria-label="Toggle navigation"
                                >
                                    <span className="navbar-toggler-icon" />
                                </button>
                                <div
                                    className="offcanvas offcanvas-start "
                                    tabIndex={-1}
                                    id="offcanvas"
                                    aria-labelledby="offcanvasLabel"
                                >
                                    <div className="offcanvas-header">
                                        <h3 className="offcanvas-title " id="offcanvasLabel">
                                            Categories
                                        </h3>
                                        <button
                                            type="button"
                                            className="btn-close me-3 "
                                            data-bs-dismiss="offcanvas"
                                            aria-label="Close"
                                        />
                                    </div>
                                    <hr />
                                    <div className="offcanvas-body">
                                        <ul className="navbar-nav justify-content-end flex-grow-1 pe-3">
                                            {categories.map(category => (
                                                <CategoriesButton key={category.id} category={category} />
                                            ))}
                                            <li className="nav-item">
                                                <button
                                                    className="nav-link"
                                                    type="button"
                                                    onClick={() => clearCategory()}
                                                    data-bs-dismiss="offcanvas">
                                                    All products
                                                </button>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div className="mx-auto p-2" style={{ width: 400 }}>
                                <form className="d-flex" role="search">
                                    <input
                                        className=" form-control me-2"
                                        type="search"
                                        placeholder="What are you looking for?"
                                        id="search"
                                        name="search"
                                        value={searchTerm}
                                        onChange={handleSearchChange}

                                    />
                                    <button className="btn btn-outline-warning" type="submit">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width={16}
                                            height={16}
                                            fill="currentColor"
                                            className="bi bi-search"
                                            viewBox="0 0 16 16"
                                        >
                                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                                        </svg>
                                    </button>

                                </form>

                            </div>
                            <div>
                                <button
                                    className="navbar-toggler"
                                    type="button"
                                    data-bs-toggle="offcanvas"
                                    data-bs-target="#offcanvasCart"
                                    aria-controls="offcanvasRight"
                                    aria-label="Toggle Cart"
                                >
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width={30}
                                        height={30}
                                        fill="currentColor"
                                        className="bi bi-cart2"
                                        viewBox="0 0 16 16"
                                    >
                                        <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z" />
                                    </svg>

                                </button>
                                <CartSidebar />
                            </div>


                            <div className="mx-1 ">

                                <button
                                    className="btn"
                                    type="button"
                                    data-bs-toggle="offcanvas"
                                    data-bs-target="#offcanvasUser"
                                    aria-controls="offcanvasRight"
                                    aria-label="Toggle User"

                                >
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width={40}
                                        height={40}
                                        fill="currentColor"
                                        className="bi bi-person-circle"
                                        viewBox="0 0 16 16"
                                    >
                                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                                        <path
                                            fillRule="evenodd"
                                            d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"
                                        />
                                    </svg>
                                </button>
                                <UserSidebar user={user} isAuthenticated={isAuthenticated} />
                            </div>
                        </div>




                    </nav>
                </>
            ) : (
                <>
                    <nav className="navbar fixed-top  bg-body-tertiary" data-bs-theme="dark">
                        <div className="container-fluid">
                            <div>
                                <button
                                    className="navbar-toggler"
                                    type="button"
                                    data-bs-toggle="offcanvas"
                                    data-bs-target="#offcanvas"
                                    aria-controls="offcanvasNavbar"
                                    aria-label="Toggle navigation"
                                >
                                    <span className="navbar-toggler-icon" />
                                </button>
                                <div
                                    className="offcanvas offcanvas-start "
                                    tabIndex={-1}
                                    id="offcanvas"
                                    aria-labelledby="offcanvasLabel"
                                >
                                    <div className="offcanvas-header">
                                        <h3 className="offcanvas-title " id="offcanvasLabel">
                                            Categories
                                        </h3>
                                        <button
                                            type="button"
                                            className="btn-close me-3 "
                                            data-bs-dismiss="offcanvas"
                                            aria-label="Close"
                                        />
                                    </div>
                                    <hr />
                                    <div className="offcanvas-body">
                                        <ul className="navbar-nav justify-content-end flex-grow-1 pe-3">
                                            {categories.map(category => (
                                                <CategoriesButton key={category.id} category={category} />
                                            ))}
                                            <li className="nav-item">
                                                <button
                                                    className="nav-link"
                                                    type="button"
                                                    onClick={() => clearCategory()}
                                                    data-bs-dismiss="offcanvas">
                                                    All products
                                                </button>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div className="mx-auto p-2" style={{ width: 400 }}>
                                <form className="d-flex" role="search">
                                    <input
                                        className=" form-control me-2"
                                        type="search"
                                        placeholder="What are you looking for?"
                                        id="search"
                                        name="search"
                                        value={searchTerm}
                                        onChange={handleSearchChange}
                                    />
                                    <button className="btn btn-outline-warning" type="submit">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width={16}
                                            height={16}
                                            fill="currentColor"
                                            className="bi bi-search"
                                            viewBox="0 0 16 16"
                                        >
                                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                                        </svg>
                                    </button>

                                </form>

                            </div>


                            <div className="mx-1 ">

                                <button
                                    className="btn"
                                    type="button"
                                    data-bs-toggle="offcanvas"
                                    data-bs-target="#offcanvasUser"
                                    aria-controls="offcanvasRight"
                                    aria-label="Toggle User"

                                >
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width={40}
                                        height={40}
                                        fill="currentColor"
                                        className="bi bi-person-circle"
                                        viewBox="0 0 16 16"
                                    >
                                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                                        <path
                                            fillRule="evenodd"
                                            d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"
                                        />
                                    </svg>
                                </button>
                                <UserSidebar user={user} isAuthenticated={isAuthenticated} />
                            </div>
                        </div>




                    </nav>
                </>
            )
            }
        </>


    )
}

export default Navbar
import React from 'react'
import CategoryButton from './CatgoryButton'


export default function CategoryStatesMenu({ categories, handleClickCategory, clearCategory }) {
    return (
        <>
            <button
                className="navbar-toggler "
                type="button"
                data-bs-toggle="offcanvas"
                data-bs-target="#offcanvasStates"
                aria-controls="offcanvas"
                aria-label="Toggle navigation"

            >
                <small>Filter category:</small>

            </button>
            <div
                className="offcanvas offcanvas-start "
                tabIndex={-1}
                id="offcanvasStates"
                aria-labelledby="offcanvasLabel"
                data-bs-theme="dark"
            >
                <div className="offcanvas-header">
                    <h3 className="offcanvas-title " id="offcanvasLabel">
                        States
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
                            <CategoryButton handleClickCategory={handleClickCategory} category={category} key={category.id} />
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
        </>
    )
}

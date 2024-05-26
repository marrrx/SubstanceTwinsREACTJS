import React from 'react'
import StatesButton from './StatesButton'

export default function OrderStatesMenu({ orderStates, handleClickOrderState, clearOrderState }) {
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
                <small>Filter state:</small>

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
                        {orderStates.map(state => (
                            <StatesButton handleClickOrderState={handleClickOrderState} state={state} key={state.id} />
                        ))}
                        <li className="nav-item">
                            <button
                                className="nav-link"
                                type="button"
                                onClick={() => clearOrderState()}
                                data-bs-dismiss="offcanvas">
                                All states
                            </button>
                        </li>
                    </ul>
                </div>
            </div>
        </>
    )
}

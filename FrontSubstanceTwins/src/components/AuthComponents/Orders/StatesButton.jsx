import React from 'react'

export default function StatesButton({handleClickOrderState, state}) {
    const {id,name} = state;
    return (
        <>
            <li className="nav-item">
                <button
                    className="nav-link"
                    type="button"
                    onClick={() => handleClickOrderState(id)}
                    data-bs-dismiss="offcanvas">
                    {name}
                </button>
            </li>
        </>
    )
}

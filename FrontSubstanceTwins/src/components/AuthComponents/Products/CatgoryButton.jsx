import React from 'react'

export default function CategoryButton({handleClickCategory, category}) {
    const {id,name} = category;
    return (
        <>
            <li className="nav-item">
                <button
                    className="nav-link"
                    type="button"
                    onClick={() => handleClickCategory(id)}
                    data-bs-dismiss="offcanvas">
                    {name}
                </button>
            </li>
        </>
    )
}

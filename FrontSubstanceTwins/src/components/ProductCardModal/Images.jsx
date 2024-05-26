import React from 'react'

export default function Images({image, index}) {
    return (
        <>
            <div className={`carousel-item ${index === 0 ? 'active' : ''}`}>
                <img src={image.image_path} className="d-block w-100" alt={image.id} style={{ height:400}}/>
            </div>
        </>
    )
}

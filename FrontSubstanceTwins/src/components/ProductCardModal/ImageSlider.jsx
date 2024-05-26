import React from 'react'
import Images from './Images';
import IndicatorSlider from './IndicatorSlider';

export default function ImageSlider({product}) {
    return (
        <>
            <div id="carouselExample" className="carousel slide">
                <div className="carousel-indicators">
                    {product.images.map((image, index) => (
                        <IndicatorSlider index={index} key={image.id} />
                    ))}
                </div>
                <div className="carousel-inner">
                    {product.images.map((image, index) => (
                        <Images image={image} key={image.id} index={index} />
                    ))}

                </div>
                <button className="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                    <span className="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span className="visually-hidden">Previous</span>
                </button>
                <button className="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                    <span className="carousel-control-next-icon" aria-hidden="true"></span>
                    <span className="visually-hidden">Next</span>
                </button>
            </div>
        </>
    )
}

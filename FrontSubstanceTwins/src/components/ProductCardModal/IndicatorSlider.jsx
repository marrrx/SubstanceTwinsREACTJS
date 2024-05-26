import React from 'react'

export default function IndicatorSlider({index}) {
    return (
        <>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to={index} className="active" aria-current="true" />
        </>
    )
}

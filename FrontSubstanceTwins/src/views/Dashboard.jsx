import React from 'react'
import Navbar from '../components/Navbar/Navbar'
import useProduct from '../contexts/Products&Categories/context/useProduct';


function Dashboard({user, isAuthenticated}) {
  const { categories, clearCategory } = useProduct();

  return (
    <>
            <Navbar user={user} isAuthenticated={isAuthenticated} categories={categories} clearCategory={clearCategory} />
    </>
  )
}

export default Dashboard
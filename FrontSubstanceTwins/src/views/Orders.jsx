import React, { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import useAuth from '../contexts/Auth/context/useAuth';
import clientAxios from '../config/axios/ClientAxios';
import useSWR from 'swr';
import useProduct from '../contexts/Products&Categories/context/useProduct';
import OrderStatesMenu from '../components/AuthComponents/Orders/OrderStatesMenu';
import OrdersTable from '../components/AuthComponents/Orders/OrdersTable';

export default function Orders({ user, isAuthenticated }) {

  const navigate = useNavigate();

  const { orderStates, handleClickOrderState, clearOrderState, actualOrderState, makeStatusCompleted,makeStatusShipped,deleteOrder} = useProduct();
  const { accessToken } = useAuth();

  const fetcher = () => clientAxios('/api/orders', {
    headers: {
      Authorization: 'Bearer ' + accessToken
    }
  });
  const { data, error, isLoading } = useSWR('/api/orders', fetcher, { refreshInterval: 1000 });


  const orders = isLoading ? [] :
    actualOrderState ? data.data.data.filter(order => order.order_statuses_id === actualOrderState.id) : data.data.data;


  return (
    <>
      <div className='container justify-content-center p-xxl-5 '>
        <div className='row'>
        <div className='col-10'>
            {actualOrderState === null ? (
              <h1>
                All states
              </h1>

            ) : (
              <h1>
                {actualOrderState.name}
              </h1>
            )}
          </div>
          <div className='col'>
            <button onClick={() => navigate('/dashboard')}>
              Go Back
            </button>
          </div>
        </div>
        <hr />

        <div className='row'>
          <div className='col mt-xxl-5 '>
            <OrderStatesMenu orderStates={orderStates} handleClickOrderState={handleClickOrderState} clearOrderState={clearOrderState} />

            <OrdersTable orders={orders} makeStatusCompleted={makeStatusCompleted} makeStatusShipped={makeStatusShipped} deleteOrder={deleteOrder}/>



          </div>
        </div>
      </div>

    </>
  )
}

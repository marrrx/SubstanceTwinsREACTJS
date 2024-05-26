import React from 'react'
import { useNavigate } from 'react-router-dom'
import clientAxios from '../config/axios/ClientAxios';
import useSWR from 'swr';
import UsersTable from '../components/AuthComponents/Users/UsersTable';


export default function Users({user, accessToken,deleteUser}) {
    const navigate = useNavigate();


    const fetcher = () => clientAxios('/api/users', {
      headers: {
        Authorization: 'Bearer ' + accessToken
      }
    });
    const { data, error, isLoading } = useSWR('/api/users', fetcher, { refreshInterval: 1000 });


    const users = isLoading ? [] : data?.data;



  return (
    <>
    <div className='container justify-content-center p-xxl-5 '>
        <div className='row'>
        <div className='col-10'>
              <h1>
                 Users
              </h1>
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

            <UsersTable users={users} deleteUser={deleteUser}/>



          </div>
        </div>
      </div>
    </>  )
}

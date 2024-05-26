import React, { useState, createContext, useContext, useEffect } from 'react'
import clientAxios from '../../../config/axios/ClientAxios';
import { ErrorContext } from '../../Errors/ErrorsContext';

const AuthContext = createContext();


const AuthProvider = ({ children }) => {

    const [isAuthenticated, setIsAuthenticated] = useState(false);
    const [user, setUser] = useState(null);
    const [accessToken, setAccessToken] = useState(null);
    const { errors, setErrors } = useContext(ErrorContext);





    const signIn = async ({ email, password }) => {
        try {
            const response = await clientAxios.post('/api/login', { email, password });

            setAccessToken(response?.data.accessToken)
            setUser(response?.data.user)
            setIsAuthenticated(true)


        } catch (e) {
            setErrors(Object.values(e.response.data.errors))
        }
    }

    const signUp = async ({ name, email, password, password_confirmation }) => {

        try {
            const response = await clientAxios.post('/api/register', { name, email, password, password_confirmation });

            setAccessToken(response?.data.accessToken)
            setUser(response?.data.user)
            setIsAuthenticated(true)


        } catch (e) {
            setErrors(Object.values(e.response.data.errors))
        }

    }

    const signOut = async () => {

        if (accessToken) {
            const response = await clientAxios.post('/api/logout', {}, {
                headers: {
                    Authorization: 'Bearer ' + accessToken
                }
            });
            if (response.status === 200) {
                console.log('Logout exitoso');
                setUser(null)
                setAccessToken(null)
                setIsAuthenticated(false)
            } else {
                console.log('Error en el logout');
            }

        } else {
            console.log('El objeto user es null');
        }

    }


    const deleteUser = async (id) => {
        if (accessToken) {
            try {
                await clientAxios.delete(
                    `/api/users/${id}`,
                    {
                        headers: {
                            Authorization: 'Bearer ' + accessToken,
                            'Content-Type': 'application/json',
                        }
                    }
                );
            } catch (error) {
                // Si hay un error al eliminar el producto, puedes manejarlo aquí
                console.error('Error deleting user:', error);
            }
        }
    }


    return (
        <AuthContext.Provider

            value={{
                user,
                accessToken,
                isAuthenticated,
                signIn,
                signUp,
                signOut,
                deleteUser
            }}


        >{children}</AuthContext.Provider>
    )

}
export {
    AuthProvider
}
export default AuthContext

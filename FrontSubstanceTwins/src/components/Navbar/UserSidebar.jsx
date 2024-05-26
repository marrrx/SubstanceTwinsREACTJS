import React, {useEffect} from 'react'
import { Link } from 'react-router-dom'
import useAuth from '../../contexts/Auth/context/useAuth';
import { useNavigate } from 'react-router-dom';

function UserSidebar({ user, isAuthenticated }) {

    const { signOut } = useAuth();
    const navigate = useNavigate();

    const handleSubmit = async e => {
        e.preventDefault();
        signOut()
    }
    useEffect(() => {
        if (!isAuthenticated && !user) {
            navigate("/");
        }
    }, [isAuthenticated, user]);

    return (
        <>
            {
                isAuthenticated && user ? (
                    <div
                        className="offcanvas offcanvas-end "
                        tabIndex={-1}
                        id="offcanvasUser"
                        aria-labelledby="offcanvasRightLabel"
                    >
                        <div className="offcanvas-header">
                            <h3 className="offcanvas-title ms-3 " id="offcanvasRightLabel">
                                User
                            </h3>

                            <button
                                type="button"
                                className="btn-close"
                                data-bs-dismiss="offcanvas"
                                aria-label="Close"
                            />

                        </div>
                        <hr />
                        <div className="offcanvas-body justify-content-center ">
                            <p>Hi again {user?.name}!</p>
                            <form onSubmit={handleSubmit}>
                                <button type='submit' className='btn btn-warning' data-bs-toggle="offcanvas"
                                    data-bs-target="#offcanvasUser">Logout</button>
                            </form>
                        </div>

                    </div>
                ) : (
                    <div
                        className="offcanvas offcanvas-end "
                        tabIndex={-1}
                        id="offcanvasUser"
                        aria-labelledby="offcanvasRightLabel"
                    >
                        <div className="offcanvas-header">
                            <h3 className="offcanvas-title ms-3 " id="offcanvasRightLabel">
                                User
                            </h3>

                            <button
                                type="button"
                                className="btn-close"
                                data-bs-dismiss="offcanvas"
                                aria-label="Close"
                            />

                        </div>
                        <hr />
                        <div className="offcanvas-body">
                            <p>Please sign in.</p>
                            <Link to="/login"> <button className='btn btn-warning' data-bs-toggle="offcanvas"
                                data-bs-target="#offcanvasUser">Sign in</button></Link>
                        </div>

                    </div>
                )
            }


        </>
    )
}

export default UserSidebar
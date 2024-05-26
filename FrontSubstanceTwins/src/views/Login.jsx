import React, { useEffect, useContext } from 'react';
import { Link } from 'react-router-dom';
import { Formik, Form, Field, ErrorMessage } from 'formik'; // Importa ErrorMessage para mostrar errores
import useAuth from '../contexts/Auth/context/useAuth';
import { ErrorContext } from '../contexts/Errors/ErrorsContext';
import Alert from '../components/Alert/Alert';
import { useNavigate } from 'react-router-dom';

function Login() {
    const { signIn, isAuthenticated, user } = useAuth();
    const { errors, clearErrors } = useContext(ErrorContext);
    const navigate = useNavigate();

    const validateForm = (values) => {
        const errors = {};
        if (!values.email) {
            errors.email = 'Email is required';
        }
        if (!/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i.test(values.email)) {
            errors.email = 'Invalid email address';
        }
        if (!values.password) {
            errors.password = 'Password is required';
        }
        return errors;
    };

    const handleLogin = async (values) => {
        const { email, password } = values;
        signIn({ email, password });
        clearErrors();
    };

    useEffect(() => {
        if (isAuthenticated) {
            if (user?.admin === 1) {
                navigate("/dashboard");
            } else {
                navigate("/");
            }
        }
    }, [isAuthenticated, user]);

    return (
        <div className="row g-2 justify-content-center">
            <div className='col-5 mt-lg-5'>
                <img src="../img/logo.svg" alt="..." />
            </div>
            <div className='col-3 mt-lg-5'>
                <h2 className="fw-normal">Log In</h2>
                <h5 className="fw-light">Insert your data in the next form</h5>
                <br />

                <div className="shadow p-3 mb-5 bg-body-tertiary rounded">
                    <Formik
                        initialValues={{ email: '', password: '' }}
                        validate={validateForm} // Asigna la función de validación al formulario
                        onSubmit={handleLogin}
                    >
                        {() => (
                            <Form>
                                {errors ? errors.map(error => <Alert key={error}>{error}</Alert>) : null}
                                <div className="mb-3">
                                    <label htmlFor="email" className="form-label">Email</label>
                                    <Field
                                        type="email"
                                        className={`form-control ${errors.email ? 'is-invalid' : ''}`}
                                        id="email"
                                        name="email"
                                        autoComplete="true"
                                    />
                                    <ErrorMessage name="email" component="div" className="error-message" />
                                </div>
                                <div className="mb-3">
                                    <label htmlFor="password" className="form-label">Password</label>
                                    <Field
                                        type="password"
                                        className={`form-control ${errors.password ? 'is-invalid' : ''}`}
                                        id="password"
                                        name="password"
                                    />
                                    <ErrorMessage name="password" component="div" className="error-message" />
                                </div>
                                <button type="submit" className="btn btn-warning">Login</button>
                            </Form>
                        )}
                    </Formik>
                </div>
                <div className="d-flex">
                    <div className="p-2 flex-fill">
                        <p className="text-body-secondary">
                            Don't have an account? <Link to="/register" className="text-reset" onClick={() => clearErrors()}>Register here</Link>.
                        </p>
                    </div>
                    <div className="p-2 flex-fill">
                        <Link to="/" className="btn btn-warning btn-sm" onClick={() => clearErrors()}>Back to the store</Link>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default Login;

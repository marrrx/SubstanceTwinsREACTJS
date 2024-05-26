import React, { useContext, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { Formik, Form, Field, ErrorMessage } from 'formik'; // Importa ErrorMessage para mostrar errores
import './Auth.css';
import useAuth from '../contexts/Auth/context/useAuth';
import { useNavigate } from 'react-router-dom';
import { createRef } from 'react';
import { ErrorContext } from '../contexts/Errors/ErrorsContext';
import Alert from '../components/Alert/Alert';

function Register() {
    const nameRef = createRef();
    const emailRef = createRef();
    const passwordRef = createRef();
    const passwordConfirmationRef = createRef();

    const { signUp, isAuthenticated } = useAuth();
    const { errors, clearErrors } = useContext(ErrorContext);
    const navigate = useNavigate();

    const validateForm = (values) => {
        const errors = {};

        if (!values.name) {
            errors.name = 'Name is required';
        }

        if (!values.email) {
            errors.email = 'Email is required';
        } else if (!/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i.test(values.email)) {
            errors.email = 'Invalid email address';
        }

        if (!values.password) {
            errors.password = 'Password is required';
        } else if (values.password.length < 6) {
            errors.password = 'Password must be at least 6 characters long';
        }

        if (!values.password_confirmation) {
            errors.password_confirmation = 'Password confirmation is required';
        } else if (values.password_confirmation !== values.password) {
            errors.password_confirmation = 'Passwords do not match';
        }

        return errors;
    };

    const handleRegister = async (values) => {
        const { name, email, password, password_confirmation } = values;
        signUp({ name, email, password, password_confirmation });
        clearErrors();
    };

    useEffect(() => {
        if (isAuthenticated) {
            navigate("/");
        }
    }, [isAuthenticated]);

    return (
        <div className="row g-2 justify-content-center">
            <div className='col-5 mt-lg-5'>
                <img src="../img/logo.svg" alt="..." />
            </div>
            <div className='col-3 mt-lg-5'>
                <h2 className="fw-normal">Create your account</h2>
                <h5 className="fw-light">Insert your data to continue</h5>
                <br />

                <div className="shadow p-3 mb-5 bg-body-tertiary rounded">
                    <Formik
                        initialValues={{
                            name: '',
                            email: '',
                            password: '',
                            password_confirmation: ''
                        }}
                        validate={validateForm} // Asigna la función de validación al formulario
                        onSubmit={handleRegister}
                    >
                        {() => (
                            <Form>
                                {errors ? errors.map(error => <Alert key={error}>{error}</Alert>) : null}

                                <div className="mb-3">
                                    <label htmlFor="name" className="form-label">Name</label>
                                    <Field
                                        type="text"
                                        className="form-control"
                                        id="name"
                                        name="name"
                                        placeholder=""
                                    />
                                    <ErrorMessage name="name" component="div" className="error-message" />
                                </div>
                                <div className="mb-3">
                                    <label htmlFor="email" className="form-label">Email</label>
                                    <Field
                                        type="email"
                                        className="form-control"
                                        id="email"
                                        name="email"
                                        placeholder="name@example.com"
                                    />
                                    <ErrorMessage name="email" component="div" className="error-message" />
                                </div>
                                <div className="mb-3">
                                    <label htmlFor="password" className="form-label">Password</label>
                                    <Field
                                        type="password"
                                        className="form-control"
                                        id="password"
                                        name="password"
                                        placeholder=""
                                    />
                                    <ErrorMessage name="password" component="div" className="error-message" />
                                </div>
                                <div className="mb-3">
                                    <label htmlFor="password_confirmation" className="form-label">Repeat your password</label>
                                    <Field
                                        type="password"
                                        className="form-control"
                                        id="password_confirmation"
                                        name="password_confirmation"
                                        placeholder=""
                                    />
                                    <ErrorMessage name="password_confirmation" component="div" className="error-message" />
                                </div>
                                <button type="submit" className="btn btn-warning">Create account</button>
                            </Form>
                        )}
                    </Formik>
                </div>

                <div className="d-flex">
                    <div className="p-2 flex-fill">
                        <p className="text-body-secondary">
                            Already have an account? <Link to="/login" className="text-reset" onClick={() => clearErrors()}>Log In</Link>.
                        </p>
                    </div>
                    <div className="p-2 flex-fill">
                        <p className="text-body-secondary">
                            <Link to="/" className="btn btn-warning btn-sm" onClick={() => clearErrors()}>Back to the store</Link>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default Register;

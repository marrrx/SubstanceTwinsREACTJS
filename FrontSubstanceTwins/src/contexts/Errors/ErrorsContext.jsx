import React, { createContext, useState } from 'react';

export const ErrorContext = createContext({
  errors: [],
  setErrors: () => { },
  clearErrors: () => { },
});

export const ErrorProvider = ({ children }) => {
  const [errors, setErrors] = useState([]);

  const clearErrors = () => {
    setErrors([]);
  };

  return (
    <ErrorContext.Provider
      value={{
        errors,
        setErrors,
        clearErrors,
      }}>
      {children}
      </ErrorContext.Provider>
  );
};

import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
// import App from './App';
import reportWebVitals from './reportWebVitals';

class Func1 extends React.Component{
  render(){
    return (<div><h1>안녕안ㄴ녕</h1><p>아아아아아아아</p></div>)
  }
}
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <Func1/>

);


reportWebVitals();

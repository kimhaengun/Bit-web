import React, { useState } from 'react'
import { Provider, useDispatch, useSelector } from 'react-redux';
import { createStore } from 'redux';
function reducer(prev={val:1}, action){
    console.log(action.type);
    if(action.type==='up') return {...prev,val:prev.val+1};
    if(action.type==='upup') return {...prev,val:prev.val+action.su};
    return {...prev};
}
const store = createStore(reducer);

export default function App2() {
  return (
    <Provider store={store}>
      <Com3/>
      <Com1 />
      <Com2 />
    </Provider>
  )
}
function Com3(){
    const dispatch = useDispatch();
    return <div><button onClick={e=>dispatch({type:'upup'})}>클릭+2</button></div>;
}
function Com1(){
    const dispatch = useDispatch();
    return <div><button onClick={e=>dispatch({type:'up'})}>클릭</button></div>;
}
function Com2(){
    const su = useSelector(state=>state.val);
    return <div><span>{su}</span></div>;
}

import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';

function DeptList() {
    const [depts,setDepts] = useState([]);

    useEffect(()=>{
        // const getList = new Promise((resolve,reject)=>{
        //     const xhr = new XMLHttpRequest();
        //     xhr.onload=(e)=>{
        //         if(xhr.status===200){
        //             const result = JSON.parse(xhr.response);
        //             console.log(result);
        //             // setDepts(result);
        //             resolve(result);
        //         }else{
        //             // console.log(xhr.status);
        //             reject(xhr.status);
        //         }
        //     };
        //     xhr.open('get','http://localhost:8080/api');
        //     xhr.send();
        // });
    //     const getList = new Promise((resolve,reject)=>{
    //         setTimeout(() => {
    //             // resolve('3초뒤 호출됨');
    //             resolve('3초뒤 호출');
    //         }, 3000);
    //     })
    //     let p = getList
    //     .then((data)=>{
    //         //resolve 출력 시
    //         // console.log(data);
    //         return data;
    //     })
    //     .then((e)=>{
    //         console.log('then then :'+e);
    //     })
    //     .catch(e=>{
    //         //reject 출력 시 
    //         console.log('에러 출력',e);
    //     });
    //     console.log('p:',p);
    
    // fetch('http://localhost:8080/api/').then((e)=>(e.json())).then(e=>setDepts(e)).catch(e=>console.log('에러:',e));

    //axios
    axios.get('http://localhost:8080/api/').then(e=> setDepts(e.data)).then();
    },[]);
    return (
    <>
        <div className="page-header">
            <h1>DeptList</h1>
        </div>
        <Link to='add' className='btn btn-primary btn-block' role={'button'}>add</Link>
        {depts.map((ele)=>(
            <Link to= {'/dept/'+ele.deptno} >
                <div className="panel panel-primary">
                    <div className="panel-heading">
                        {ele.dname}
                    </div>
                    <div className="panel-body">
                        {ele.loc}
                    </div>
                </div>
            </Link>
        ))}
    </>
    );
}

export default DeptList;
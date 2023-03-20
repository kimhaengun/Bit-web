import axios from 'axios';
import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

function Deptadd() {
    //뒤로가기
    const navigate = useNavigate();
    const bck = () =>navigate(-1);

    const sbt=e=>{
        e.preventDefault();
        let params = {
            deptno: Number(e.target.deptno.value),
            dname: e.target.dname.value,
            loc: e.target.loc.value
         }
        // let params=            
        //     'deptno= '+Number(e.target.deptno.value)+'&dname='+ e.target.dname.value+'&loc='+ e.target.loc.value
        axios({
            method:'post',
            url:'http://localhost:8080/api/',
           data: params
        }
           
        ).finally(function(){
            navigate('/');
                })

    }
    return (
    <>
        <div className="page-header">
            <h1>DeptAdd</h1>
        </div>
        <form onSubmit={sbt}>
            <div className='form-group'>
                
                    <input className="form-control" name='deptno' placeholder='deptno'/>
                
            </div>
            <div className='form-group'>
                
                    <input className="form-control" name='dname' placeholder='dname'/>
                
            </div>
            <div className='form-group'>
                
                    <input className="form-control" name='loc' placeholder='loc'/>
                
            </div>
            <div className='form-group'>
                <button className='btn btn-primary btn-block' type='submit'>입력</button>
                <button className='btn btn-default btn-block' type='reset'>취소</button>
                <button onClick={bck} className='btn btn-default btn-block' type='button'>뒤로</button>
            </div>

        </form>
    </>
    );
}

export default Deptadd;
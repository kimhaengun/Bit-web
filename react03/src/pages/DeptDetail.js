import axios from 'axios';
import React, { useEffect, useRef, useState } from 'react';
import { useNavigate, useParams } from 'react-router-dom';

function DeptDetail() {
    const navigate = useNavigate();
    const {deptno} = useParams();
    const [bean,setBean]=useState({});
    const [edit,setEdit]=useState(false);
    const [dinput,setDinput]=useState({dname:bean.dname,loc:bean.loc});
    const ref1 = useRef();
    useEffect(()=>{
        axios.get('http://localhost:8080/api/'+deptno,).then(data=>{setBean(data.data); setDinput(data.data)})
    },[])

    //dname 변경 시 이벤트
    const input1 = e=>{
        setDinput({...dinput,dname:e.target.value});
    };

    //loc 변경 시 이벤트
    const input2 = e=>{
        setDinput({...dinput,loc:e.target.value});
    };
    
    const editForm=e=>{
        setEdit(true);

    };

    
    const sbt=e=>{
        e.preventDefault();
        let params = {
            deptno: Number(e.target.deptno.value),
            dname: e.target.dname.value,
            loc: e.target.loc.value
         }
        axios
        // .put('http://localhost:8080/api/'+deptno,{deptno:e.target.deptno, dname:e.target.dname, loc:e.target.loc}).then(e=>navigate('/dept/'))
        ({method:'put',url:'http://localhost:8080/api/'+deptno,data:params}).then(e=>navigate('/dept/'));
    };

    const del = e=>{
        
        axios({method:'delete',url:'http://localhost:8080/api/'+deptno}).then(e=>navigate('/dept/'));
    }
    const bck=e=>{
        alert(ref1.current.value);
        if(edit)setEdit(!edit);
        else navigate(-1);
    }
    return (
    <>
        <div className="page-header">
            <h1>{!edit?"DeptDetail"+{deptno}:"DeptUpdate"+{deptno}}</h1>
        </div>

        <form onSubmit={sbt}>
            <div className='form-group'>
                
                    {!edit?bean.deptno:<input ref={ref1} className="form-control" name='deptno' value={bean.deptno} />}
                
            </div>
            <div className='form-group'>
                
                    {!edit?bean.dname:<input onChange={input1} className="form-control" name='dname' value={dinput.dname}/>}
                
            </div>
            <div className='form-group'>
                
                    {!edit?bean.loc:<input onChange={input2} className="form-control" name='loc' value={dinput.loc}/>}
                
            </div>
            <div className='form-group'>
                {!edit?(<>
                <button onClick={editForm} className='btn btn-primary btn-block' type='button'>수정</button>
                <button onClick={del} className='btn btn-danger btn-block' type='button'>삭제</button></>)
                :
                <button className='btn btn-primary btn-block' type='submit'>수정</button>
                }
                <button className='btn btn-default btn-block' type='reset'>취소</button>
                <button onClick={bck} className='btn btn-default btn-block' type='button'>뒤로</button>
            </div>

        </form>

    </>
    );
}

export default DeptDetail;
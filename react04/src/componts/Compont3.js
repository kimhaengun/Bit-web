import { useDispatch } from "react-redux";

export default function Com3(){
    //값 변경 - useDispatch
    const dispatch = useDispatch();
    return <div><button onClick={e=>dispatch({type:'upup',su:-1})}>클릭+2</button></div>;
}

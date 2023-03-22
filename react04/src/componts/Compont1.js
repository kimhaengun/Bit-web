import { useDispatch} from "react-redux";

export default function Com1(){
    const dispatch = useDispatch();
    return <div><button onClick={e=>dispatch({type:'up'})}>클릭</button></div>;
}
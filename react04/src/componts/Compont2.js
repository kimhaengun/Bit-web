import { useSelector } from "react-redux";

export default function Com2(){
    //값불러오기 selector
    const su = useSelector(state=>state.val);
    return <div><span>{su}</span></div>;
}
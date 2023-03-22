import { Provider } from 'react-redux';
import Com3 from './componts/Compont3';
import store from './componts/store';
import Com4 from './componts/Compont4';
import Com5 from './componts/Compont5';


export default function App2() {
  return (
    <Provider store={store}>
      <Com3/>
      <Com4 />
      <Com5 />
    </Provider>
  )
}



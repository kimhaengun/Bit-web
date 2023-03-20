import React from 'react';
import { NavLink, Outlet } from 'react-router-dom';

function Layout() {
    return (
        <>
        <nav className="navbar navbar-inverse">
        <div className="container-fluid">
          <div className="navbar-header">
            <button type="button" className="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
              <span className="sr-only">Toggle navigation</span>
              <span className="icon-bar"></span>
              <span className="icon-bar"></span>
              <span className="icon-bar"></span>
            </button>
            <NavLink className="navbar-brand" href="#">Brand</NavLink>
          </div>
      
          <div className="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul className="nav navbar-nav">
                <li><NavLink to="/" className={({ isActive, isPending }) => isPending ? "pending" : isActive ? "active" : "" } end>
                        Home
                </NavLink></li>
                <li><NavLink to="/intro" className={({ isActive, isPending }) => isPending ? "pending" : isActive ? "active" : "" } end>
                        intro
                </NavLink></li>
                <li><NavLink to="/dept" className={({ isActive, isPending }) => isPending ? "pending" : isActive ? "active" : "" }>
                        Dept
                </NavLink></li>
            </ul>
            </div>
        </div>
        </nav>
        <div className='container'>
            <Outlet/>
        </div>
    </>
    );
}

export default Layout;
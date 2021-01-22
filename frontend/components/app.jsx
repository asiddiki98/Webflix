import React from 'react';
import { Route, Switch } from 'react-router-dom';
import SignupContainer from './session/signup_container';
import NavBarContainer from './nav_bar/nav_bar_container';
import LoginContainer from './session/login_container';
import RegisterContainer from './register/register_container'
import Footer from './footer'
import { AuthRoute } from '../utils/route_utils'



export default () => {
    return (
        <div className={"main-div"}>
            <Route path="/" component={NavBarContainer}/>
            <div className="between-header-footer">
            <Switch>
                <AuthRoute exact path="/" component={RegisterContainer}/> 
                <AuthRoute path="/signup" component={SignupContainer}/> 
                <AuthRoute path="/login" component={LoginContainer}/> 
            </Switch>
            </div>
            <Route path="/" component={Footer}/>
        </div>
    )
}
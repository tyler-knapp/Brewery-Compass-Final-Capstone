import Vue from 'vue'
import Router from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../views/Login.vue'
import Logout from '../views/Logout.vue'
import Register from '../views/Register.vue'
import store from '../store/index'
import Breweries from '../views/Breweries.vue'
import BreweryDetail from '../views/BreweryDetail.vue'
import NotFound from '../views/NotFound.vue'
import EditBrewery from '../views/EditBrewery.vue'
import NewBreweryForm from '../views/NewBreweryForm.vue'
import BeerDetail from '../views/BeerDetail.vue'
import NewBeerForm from '../views/NewBeerForm.vue'




Vue.use(Router)

/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/not-found",
      name: "NotFound",
      component: NotFound,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/login",
      name: "login",
      component: Login,
      meta: {
        requiresAuth: false 
  
      }
    },
    {
      path: "/logout",
      name: "logout",
      component: Logout,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/register",
      name: "register",
      component: Register,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: '/edit-brewery/:id',
      name: 'EditBrewery',
      component: EditBrewery,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/breweries",
      name: "breweries",
      component: Breweries,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: '/breweries/:breweryID',
      name: 'breweries-detail',
      component: BreweryDetail,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: '/add-brewery',
      name: 'AddBrewery',
      component: NewBreweryForm,
      meta: {
        requiresAuth: false
      }
    },
     {
       path: '/breweries/:breweryID/beers/:beerID',
       name: 'beer-detail',
       component: BeerDetail,
       meta: {
         requiresAuth: false
       }
     },
     
    {
      path: '/add-beer',
      name: 'AddBeer',
      component: NewBeerForm ,
      meta: {
        requiresAuth: false
      }
    },


  ]
})

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    next("/login");
  } else {
    // Else let them go to their next destination
    next();
  }
});





export default router;

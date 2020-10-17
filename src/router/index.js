import Vue from 'vue'
import VueRouter from 'vue-router'
import store from '../store/store';

Vue.use(VueRouter)

const routes = [
  {
    path: '/auth',
    name: 'auth',
    component: () => import(/* webpackChunkName: "about" */ '../views/Auth.vue')
  },
  {
    path: '/test',
    name: 'test',
    component: () => import(/* webpackChunkName: "about" */ '../views/Test.vue')
  },
  {
    path: '/user',
    name: 'user',
    component: () => import(/* webpackChunkName: "about" */ '../views/User.vue'),
    beforeEnter: (to, from, next) => {
      if (!store.state.authUser.authenticated) {
        next({
          path: '/auth',
          name: 'auth',
          component: () => import('../views/Auth.vue')
        })
      }
      else {
        next()
      }
    }
  },
  {
    path: '/items/newItem',
    name: 'newItem',
    component: () => import(/* webpackChunkName: "about" */ '../views/NewItem.vue'),
    beforeEnter: (to, from, next) => {
      if (!store.state.authUser.authenticated) {
        next({
          path: '/auth',
          name: 'auth',
          component: () => import('../views/Auth.vue')
        })
      }
      else {
        next()
      }
    }
  },
  {
    path: '/',
    name: 'home',
    component: () => import(/* webpackChunkName: "about" */ '../views/Home.vue'),
    beforeEnter: (to, from, next) => {
      if (!store.state.authUser.authenticated) {
        next({
          path: '/auth',
          name: 'auth',
          component: () => import('../views/Auth.vue')
        })
      }
      else {
        next()
      }
    }
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
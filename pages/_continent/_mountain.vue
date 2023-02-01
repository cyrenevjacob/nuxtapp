<template>
    <div>
      <Header />
      <div style="text-align: center; margin: 0; padding: 1em;"><h1 style="display: inline-block; font-weight: 200;">Continent:</h1>&nbsp;<h1 style="color:red;display: inline-block; font-weight: bold;">{{ continent }}</h1></div>
      <h2>Mountain: {{ mountain }}</h2>
      <p>Path: {{ $route.path }}</p>
      <NuxtLink to="/">Back to Mountains</NuxtLink>
      <Footer />
    </div>
  </template>
  <script allowJs="true">
  export default {
    async asyncData({ params, redirect }) {
      const mountains = await fetch(
        'https://api.nuxtjs.dev/mountains'
      ).then((res) => res.json())
  
      const filteredMountain = mountains.find(
        (el) =>
          el.continent.toLowerCase() === params.continent &&
          el.slug === params.mountain
      )
      if (filteredMountain) {
        return {
          continent: filteredMountain.continent,
          mountain: filteredMountain.title
        }
      } else {
        redirect('/')
      }
    }
  }
  </script>  
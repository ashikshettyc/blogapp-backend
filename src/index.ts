import path from 'path';




export default {
  register({ strapi }) {
    const lifecyclePath = path.resolve(__dirname, './api/blog/content-types/blog/lifecycles.ts');
    console.log('Registering Blog Lifecycle:', lifecyclePath);
  },

  bootstrap(/* { strapi }: { strapi: Core.Strapi } */) {},
};

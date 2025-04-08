export default [
  'strapi::logger',
  'strapi::errors',
  'strapi::security',
  {
    name: 'strapi::cors',
    config: {
      origin: ['https://your-frontend-domain.com', 'http://localhost:3001'], // 👈 add your domains here
      methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
      headers: '*',
      credentials: true, // if using cookies/sessions
    },
  },
  'strapi::poweredBy',
  'strapi::query',
  'strapi::body',
  'strapi::session',
  'strapi::favicon',
  'strapi::public',
];

module.exports = {
  async beforeCreate(event) {
    // Prevent the count field from being added during blog creation
    if (event.params.data?.count !== undefined) {
      delete event.params.data.count;
    }
  },

  async beforeUpdate(event) {
    // Ensure count can only be updated explicitly (e.g., using a mutation)
    const { data } = event.params;
    if (data.count !== undefined) {
      // You may add additional validation or logic here if needed
      console.log('Updating count field:', data.count);
    }
  },
};

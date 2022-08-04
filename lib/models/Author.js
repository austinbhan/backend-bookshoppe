const pool = require('../utils/pool');

module.exports = class Author {
  name;
  dob;
  pob;

  constructor(row) {
    this.name = row.name;
    this.dob = row.dob;
    this.pob = row.pob;
  }

  static async getAll() {
    const { rows } = await pool.query('SELECT * FROM authors;');
    return rows.map((row) => new Author(row));
  }
};

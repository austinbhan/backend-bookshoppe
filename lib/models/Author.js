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

  static async getById(id) {
    const { rows } = await pool.query('SELECT * FROM authors WHERE id=$1', [id]);
    if(!rows[0]) return null;

    return new Author(rows[0]);
  }
  // insert function here
  static async insert({ name, dob, pob }) {
    const { rows } = await pool.query(
      'insert into authors (name, dob, pob) values ($1, $2, $3) returning *;',
      [name, dob, pob]
    );
    return new Author(rows[0]);
  }
  // add AuthorById from Here
  async addAuthorById(bookId) {
    await pool.query(
      'INSERT INTO books_authors (books_id, author_id) VALUES ($1, $2, $3) RETURNING *',
      [this.id, bookId]
    );
    return this;
  }
};


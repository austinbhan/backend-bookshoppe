const pool = require('../utils/pool');
const Author = require('./Author');

module.exports = class Book {
  id;
  title;
  released;

  constructor(row) {
    this.id = row.id;
    this.title = row.title;
    this.released = row.released;
  }

  static async getAll() {
    const { rows } = await pool.query('SELECT * FROM books;');
    return rows.map((row) => new Book(row));
  }

  //   Add getById Here
  static async getById(id) {
    const { rows } = await pool.query(
      `SELECT books.* from books
      WHERE books.id = $1  
      `, [id]);
    return new Book(rows[0]);
  }
  async getAuthorsByBookId() {
    const { rows } = await pool.query(
      `SELECT
    authors.id, authors.name from books
      LEFT JOIN books_authors on books.id = books_authors.books_id
      LEFT JOIN authors on books_authors.author_id = authors.id
      WHERE books.id = $1
      GROUP BY authors.id`, [this.id]);
    this.authors = rows;}

  // insert function here
  static async insert({ title, released }) {
    const { rows } = await pool.query(
      'insert into books (title, released) values ($1, $2) returning *;',
      [title, released]
    );
    return new Book(rows[0]);
  }

  // addPetById from Here
  async addAuthorById(authorId) {
    await pool.query(
      'INSERT INTO books_authors (books_id, author_id) VALUES ($1, $2) RETURNING *',
      [this.id, authorId]
    );
    return this;
  }
  

};

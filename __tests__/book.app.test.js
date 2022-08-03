const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');
const app = require('../lib/app');

describe('book-routes', () => {
  beforeEach(() => {
    return setup(pool);
  });

  // getByAll
  it('Should return the full list of books', async () => {
    const res = await request(app).get('/books');
    const expected = [
      { 'id':'1', 'title':'The Lathe of Heaven', 'released':1997 },
      { 'id':'2', 'title':'The Sound of the Mountain', 'released':1954 },
      { 'id':'3', 'title':'The Metamorphosis', 'released':1915 },
      { 'id':'4', 'title':'The Yin and Yang of American Culture', 'released':2001 },
      { 'id':'5', 'title':'Rich Dad Poor Dad', 'released':1997 },
      { 'id':'6', 'title':'The Unbearable Lightness of Being', 'released':1984 }
    ];
    expect(res.body).toEqual(expected);
  });



  // getById
});

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Bookshop10;

/// <summary>
/// Summary description for BusinessLogic
/// </summary>
/// 
namespace Bookshop10
{
    public class BusinessLogic
    {
        Bookshop b = new Bookshop();
        public List<Book> GetBooks
        {
            get
            {
                return b.Books.ToList<Book>();
            }

        }
        public List<Book> GetSearchBook(string Title)
        {
            List<Book> bk = b.Books.Where(o => o.Title.Contains(Title)).ToList();
            return bk;
        }
        public int Count
        {
            get
            {
                return GetBooks.Count;
            }
        }
        public List<String> GetISBN
        {
            get
            {
                return b.Books.Select(c => c.ISBN).ToList();
            }
        }

    }
}
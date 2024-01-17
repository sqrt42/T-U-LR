using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
public abstract class AnimalToy
{
    string name;
    public AnimalToy(string newName)
    {
        name = newName;
    }


    public string GetName()
    {
        return name;
    }
}

public abstract class Cat : AnimalToy
{
    protected Cat(string name) : base(name) { }
}

public abstract class Bear : AnimalToy
{
    protected Bear(string name) : base(name) { }
}

class WoodenCat : Cat
{
    public WoodenCat() : base("Wooden Cat") { }
}

class TeddyCat : Cat
{
    public TeddyCat() : base("Teddy Cat") { }
}

class WoodenBear : Bear
{
    public WoodenBear() : base("Wooden Bear") { }
}

class TeddyBear : Bear
{
    public TeddyBear() : base("Teddy Bear") { }
}

public interface IToyFactory
{
    Bear GetBear();
    Cat GetCat();
}

public class TeddyToysFactory : IToyFactory
{
    public Bear GetBear()
    {
        return new TeddyBear();
    }
    public Cat GetCat()
    {
        return new TeddyCat();
    }
}

public class WoodenToysFactory : IToyFactory
{
    public Bear GetBear()
    {
        return new WoodenBear();
    }
    public Cat GetCat()
    {
        return new WoodenCat();
    }
}

namespace lab6
{
    class Program
    {
        static void Main(string[] args)
        {
            TeddyToysFactory teddyToysFactory = new TeddyToysFactory();
            Console.WriteLine(teddyToysFactory.GetBear().GetName());
            WoodenToysFactory woodenToysFactory = new WoodenToysFactory();
            Console.WriteLine(woodenToysFactory.GetCat().GetName());
        }
    }
}

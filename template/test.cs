using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace KeywordDemo // keyword.other.namespace.cs
{
    public abstract class BaseClass // keyword.other.abstract.cs, keyword.other.class.cs
    {
        public abstract void AbstractMethod();
        public virtual void VirtualMethod() => Console.WriteLine("Virtual Method"); // keyword.other.virtual.cs
    }

    public sealed class DerivedClass : BaseClass // keyword.other.sealed.cs
    {
        public override void AbstractMethod() // keyword.other.override.cs
        {
            Console.WriteLine("Abstract method implemented.");
        }
    }

    public struct MyStruct // keyword.other.struct.cs
    {
        public int Value;
    }

    public interface IMyInterface // keyword.other.interface.cs
    {
        void InterfaceMethod();
    }

    public enum MyEnum // keyword.other.enum.cs
    {
        First,
        Second,
        Third
    }

    public delegate void MyDelegate(string message); // keyword.other.delegate.cs

    public class KeywordExamples : IMyInterface // keyword.other.class.cs
    {
        public event MyDelegate MyEvent; // keyword.other.event.cs
        public const int ConstValue = 10; // keyword.other.const.cs
        public readonly int ReadOnlyValue; // keyword.other.readonly.cs
        public volatile int VolatileValue; // keyword.other.volatile.cs
        public static string StaticString = "Hello, World!"; // keyword.other.static.cs

        public KeywordExamples()
        {
            ReadOnlyValue = 20;
        }

        public unsafe void UnsafeMethod() // keyword.other.unsafe.cs
        {
            int value = 10;
            int* ptr = &value; // keyword.other.fixed.cs
            Console.WriteLine(*ptr);
        }

        public void InterfaceMethod() => Console.WriteLine("Interface method called");

        public static implicit operator string(KeywordExamples obj) => "Implicit Conversion"; // keyword.other.implicit.cs
        public static explicit operator int(KeywordExamples obj) => 42; // keyword.other.explicit.cs

        public void ParamsMethod(params int[] numbers) // keyword.other.params.cs
        {
            foreach (var number in numbers)
                Console.WriteLine(number);
        }

        public void RefOutInMethod(ref int refVal, out int outVal, in int inVal) // keyword.other.ref.cs, keyword.other.out.cs, keyword.other.in.cs
        {
            refVal += 2;
            outVal = inVal * 2;
        } 

        public void OperatorOverload() // keyword.other.operator.cs
        {
            if (this is KeywordExamples) // keyword.other.is.cs
            {
                Console.WriteLine("This is a KeywordExamples instance.");
            }
        }

        public void TypeChecking()
        {
            object obj = "Hello";
            string str = obj as string; // keyword.other.as.cs
            Console.WriteLine(str);
        }

        public void SizeTypeMethods()
        {
            Console.WriteLine(sizeof(int)); // keyword.other.sizeof.cs
            Console.WriteLine(typeof(string)); // keyword.other.typeof.cs
        }

        public void CheckedUncheckedMethods()
        {
            checked
            {
                int max = int.MaxValue;
            }

            unchecked
            {
                int overflow = int.MaxValue + 1;
            }
        }

        public void LockExample()
        {
            object obj = new object();
            lock (obj) // keyword.other.lock.cs
            {
                Console.WriteLine("Locked block");
            }
        }

        public async Task AwaitExample() // keyword.other.await.cs
        {
            await Task.Delay(1000);
        }

        public IEnumerable<int> YieldExample() // keyword.other.yield.cs
        {
            yield return 1;
            yield return 2;
        }
    }

    public record MyRecord(string Name, int Age); // keyword.other.record.cs

    class Program
    {
        static void Main()
        {
            using (KeywordExamples ke = new KeywordExamples()) // keyword.other.using.cs
            {
                ke.OperatorOverload();
            }

            var myRecord = new MyRecord("Alice", 25); // keyword.other.var.cs, keyword.other.with.cs
            Console.WriteLine(myRecord with { Age = 26 });

            var numbers = new List<int> { 1, 2, 3, 4, 5 };
            var evenNumbers = from num in numbers // keyword.other.from.cs
                              where num % 2 == 0 // keyword.other.where.cs
                              select num; // keyword.other.select.cs
        }
    }
}

namespace ConsoleApp9
{
    internal class Program
    {
        static void Main(string[] args)
        {
            char[] harfler = "TÜRKİYE".ToCharArray();

            // harfleri foreach kullanarak satır satır yazdır:
            foreach (char c in harfler)
                Console.WriteLine(c+" ");
            Console.ReadKey();
        }
    }
}
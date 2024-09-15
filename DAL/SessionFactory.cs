using NHibernate;
using NHibernate.Cfg;

namespace ProjectMgt.DAL
{
    public class SessionFactory

    {
        public SessionFactory()

        {
        }

        private static ISessionFactory sessions;

        private static Configuration cfg;

        private static readonly object padlock = new object();

        public static ISession OpenSession(string AssemblyName)

        {
            if (sessions == null)

            {
                lock (padlock)

                {
                    if (sessions == null)

                    {
                        BuildSessionFactory(AssemblyName);
                    }
                }
            }


            return sessions.OpenSession();
        }

        private static void BuildSessionFactory(string AssemblyName)

        {
            cfg = new Configuration();

            cfg.AddAssembly(AssemblyName);

            sessions = cfg.BuildSessionFactory();

        }
    }
}
As long as JDBC can find the driver in our classpath, we won't need to do anything special to make it work - so let's write some code & try it out!

Start a new Java program, `Example.java`{{open}} (click that link!)

And add the following snippet:

<pre class="file" data-filename="Example.java" data-target="replace">import java.sql.*;

public class Example
{
   public static void main(String[] args)
   {
      try
      {
         String url = "jdbc:postgresql://localhost:5432/demo?user=postgres&amp;password=password";
         Connection conn = DriverManager.getConnection(url);

         Statement st = conn.createStatement();
         ResultSet rs = st.executeQuery("select table_schema, table_name from information_schema.tables");
         while (rs.next()) 
         {
             System.out.format("%s: %s\n", rs.getString(1), rs.getString(2));
         }
         rs.close();
         st.close();
      } 
      catch (SQLException e)
      {
         System.err.println(e);
      }
   }
}
</pre>

Observe that all of the Postgres-specific information is contained in the connection URL...

```
jdbc:postgresql://localhost:5432/demo?user=postgres&password=password
```

...and in the query itself (which just pulls a list of tables from the system). JDBC uses the connection string to find the Postgres driver, and then hands the query to the driver to do the rest of the work.

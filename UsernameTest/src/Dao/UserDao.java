package Dao;

public interface UserDao {

    public boolean Login(String username, String password);

    public int UsernameSame(String username);

}

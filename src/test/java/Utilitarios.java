import com.github.javafaker.Faker;

public class Utilitarios {

    public static int getToken(){
        int token = 1231232131;
        return token;
    }

    public static String getMessage(String message){
        return message + " Bienvenido";
    }

    public static String getNumberRandom(){
        Faker faker = new Faker();
        String number = faker.phoneNumber().cellPhone();
        return number;
    }

}

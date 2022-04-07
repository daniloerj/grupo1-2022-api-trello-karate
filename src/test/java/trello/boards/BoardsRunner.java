package trello.boards;

import com.intuit.karate.junit5.Karate;

public class BoardsRunner {

    @Karate.Test
    Karate testAllBoards() {
        return Karate.run("boards-workflows").relativeTo(getClass());
    }

    @Karate.Test
    Karate testCreateBoards() {
        return Karate.run("boards-workflows").scenarioName("crear tablero").relativeTo(getClass());
    }

    @Karate.Test
    Karate testSmokeBoards() {
        return Karate.run("boards-workflows").tags("smoke").relativeTo(getClass());
    }

    @Karate.Test
    Karate testRegressionBoards() {
        return Karate.run("boards-workflows").tags("regression").relativeTo(getClass());
    }
}

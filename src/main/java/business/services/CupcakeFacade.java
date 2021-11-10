package business.services;

import business.entities.Bot;
import business.entities.Top;
import business.exceptions.UserException;
import business.persistence.CupcakeMapper;
import business.persistence.Database;

import java.util.List;

public class CupcakeFacade {

    CupcakeMapper cupcakeMapper;

    public CupcakeFacade(Database database) {
        cupcakeMapper = new CupcakeMapper(database);
    }


    public Bot getBot(int botId) throws UserException {
        return cupcakeMapper.getBot(botId);
    }


    public Top getTop(int topId) throws UserException {
        return cupcakeMapper.getTop(topId);
    }


    public List<Bot> getAllBottoms() throws UserException {
        return cupcakeMapper.getAllBots();
    }

    public List<Top> getAllTops() throws UserException {
        return cupcakeMapper.getAllTops();
    }
}

import Foundation

class TransferService {
    
    private var transfer: Transfer
    
    init(transfer: Transfer) {
        self.transfer = transfer
    }
    
    func getTransfer()  -> Transfer? {
        let transferUrl = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-viper-finance/main/api/transfer_successful_endpoint.json")
        
        guard let url = transferUrl else { return nil }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let transfer = data else { return }
            self.transfer = self.convert(to: transfer)
        }
        
        task.resume()
        
        return self.transfer
    }
    
    private func convert(to transfer: Data) -> Transfer {
        let decoder = JSONDecoder()
        let transfer = try! decoder.decode(Transfer.self, from: transfer)
        return transfer
    }
    
}

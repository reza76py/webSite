import { useState } from 'react'
import axios from 'axios'

function App() {
  const [name, setName] = useState('')
  const [text, setText] = useState('')
  const [response, setResponse] = useState('')

  const handleSubmit = async () => {
    try {
      const res = await axios.post('http://localhost:8000/api/message/', { name, text })
      setResponse(res.data.message)
    } catch (err) {
      console.error(err)
      setResponse('Error saving message.')
    }
  }

  return (
    <div className="p-8 text-black bg-gray-100 min-h-screen">
      <h1 className="text-2xl font-bold mb-4">Send a Message</h1>
      <input className="block p-2 mb-2 text-black" placeholder="Your name" value={name} onChange={e => setName(e.target.value)} />
      <textarea className="block p-2 mb-2 text-black" placeholder="Your message" value={text} onChange={e => setText(e.target.value)} />
      <button className="bg-blue-500 hover:bg-blue-600 px-4 py-2 rounded" onClick={handleSubmit}>Send</button>
      <p className="mt-4">{response}</p>
    </div>
  )
}

export default App

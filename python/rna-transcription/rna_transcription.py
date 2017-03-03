def transcribe(amino):
    dna = {'C': 'G', 'G': 'C', 'T': 'A', 'A': 'U'}
    return dna[amino]

def to_rna(dna):
    return ''.join(map(transcribe, list(dna)))

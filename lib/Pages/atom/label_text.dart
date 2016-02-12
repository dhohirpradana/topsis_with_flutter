labelText(index) => (index == 0)
    ? 'Tinggi (' 'C' + (index + 1).toString() + ')'
    : (index == 1)
        ? 'Kepekatan warna hijau daun (' 'C' + (index + 1).toString() + ')'
        : (index == 2)
            ? 'Kesehatan tanaman (' 'C' + (index + 1).toString() + ')'
            : (index == 3)
                ? 'Kesempurnaan bagian tanaman ('
                        'C' +
                    (index + 1).toString() +
                    ')'
                : 'Bunga (' 'C' + (index + 1).toString() + ')';
